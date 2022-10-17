package com.mbds.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.multipart.MultipartFile

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_ADVERTISER'])
class AnnonceController {
    AnnonceService AnnonceService
    AnnonceServService annonceServService
    UserService userService
    @Autowired
    SpringSecurityService springSecurityService



    static allowedMethods = [save: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 12, 100)
        respond AnnonceService.list(params), model:[annonceCount: AnnonceService.count()]
    }

    def show(Long id) {
        respond AnnonceService.get(id)
    }

    def create() {
        respond userService.list(params)
        respond new Annonce(params)
    }

    def save(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }
        try {
            if (params.author==null) {
                def user = springSecurityService.getCurrentUser()
                annonce.author=user
            }
            def date= new Date().format('yymmddhhmmss')
            List files=[]
                request.getFiles("illustrationFiles").each { file ->
                    int indexpoint = file.filename.lastIndexOf(".")
                    if (indexpoint>-1){
                    file.transferTo(new File(grailsApplication.config.illustrations.baseUrl+date+file.filename))
                    files.add(date+file.filename)}
                }
            files.each {
                annonce.addToIllustrations(new Illustration(filename:it))
            }
            AnnonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond userService.list(params)
        respond AnnonceService.get(id)
    }
    def update(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }

        try {
            if (params.author==null) {
                def user = springSecurityService.getCurrentUser()
                annonce.author=user
            }
            List files=[]
            def date= new Date().format('yymmddhhmmss')
            //Si l'utilisateur souhaite Supprimer les images existantes
            def filesTodel=annonce.illustrations
            if (params.deleteIll) {
            filesTodel.each {
                annonce.removeFromIllustrations(new Illustration(filename:  it))
            }
            }
            //Si l'utilisateur souhaite ajouter des images à celles déjà existantes
            if (params.addIll) {
                request.getFiles("illustrationFiles").each { file ->
                file.transferTo(new File(grailsApplication.config.illustrations.baseUrl+date+file.filename))
                files.add(date+file.filename)
            }}
            files.each {
                annonce.addToIllustrations(new Illustration(filename:it))
            }
            AnnonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view:'edit'
            return
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*'{ respond annonce, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        AnnonceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'annonce.label', default: 'Annonce'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'annonce.label', default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    def find(){
        String toSearch=params.search
        def annonces= annonceServService.searchAnnonce(toSearch)
        render view: "index", model: [annonceCount: annonces.size(),annonceList:annonces]
    }
}

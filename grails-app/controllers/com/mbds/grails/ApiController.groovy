package com.mbds.grails


import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.http.HttpMethod

@Secured('ROLE_ADMIN')
class ApiController {
    AnnonceServService annonceServService
    UserServService userServService

    /**
     * Singleton
     * Gestion des points d'entrée : GET / PUT / PATCH / DELETE
     */
    def annonce() {
        // On vérifie qu'un ID ait bien été fourni
        if (!params.id)
            return response.status = 400
        // On vérifie que l'id corresponde bien à une instance existante
        def annonceInstance = Annonce.get(params.id)
        if (!annonceInstance)
            return response.status = 404

        switch (request.getMethod()) {

            case "GET":
                renderThis(request.getHeader("Accept"), annonceInstance)
                break;
            case "PUT":
                def data= JSON.parse(request)
                if(!data.title || !data.price || !data.description || !data.active || !data.author){
                    render(status :400,text: 'Missing parameters')
                    return
                }else {
                    def annonce = annonceServService.updateAnnonce(params.id,data)
                    render(status :response.status,text: 'Annonce added')
                    return annonce
                }
                break;
            case "PATCH":
                def data= JSON.parse(request)
                def annonce = annonceServService.updateAnnonce(params.id,data)
                return annonce
                break;
            case "DELETE":
                annonceInstance.delete(flush:true)
                return response.status
                break;
            default:
                return response.status = 405
                break;
        }
        return response.status = 406
    }

    /**
     * Collection
     * POST / GET
     */
    def annonces() {
        def annoncesInstance = Annonce.list()

        switch (request.getMethod()) {

            case "GET":
                renderThis(request.getHeader("Accept"), annoncesInstance)
                break;
            case "POST":
               def data= JSON.parse(request)
                data.folder=grailsApplication.config.illustrations.basePath
                def annonce=annonceServService.createAnnonce(data)
                render(status :response.status,text: 'Annonce added')
                return annonce
                break;
            default:
                return response.status = 405
                break;
        }
        return response.status = 406
    }

    def user() {
        // On vérifie qu'un ID ait bien été fourni
        if (!params.id)
            return response.status = 400
        // On vérifie que l'id corresponde bien à une instance existante
        def userInstance = User.get(params.id)
        if (!userInstance)
            return response.status = 404

        switch (request.getMethod()) {
            case "GET":
                renderThis(request.getHeader("Accept"), userInstance)
                break;
            case "PUT":
                def data= JSON.parse(request)
                if(!data.username || !data.password){
                    render(status :400,text: 'Missing parameters')
                    return
                }else {
                    userServService.updateUser(params.id,data)
                    render(status :response.status,text: 'User updated')
                    return
                }
                break;
            case "PATCH":
                def data= JSON.parse(request)
                userServService.updateUser(params.id,data)
                render(status :response.status,text: 'User updated')
                return
                break;
            case "DELETE":
                userServService.deleteUser(params.id)
                render(status :response.status,text: 'User deleted')
                return
                break;
            default:
                return response.status = 405
                break;
        }
        return response.status = 406
    }

    def users() {
        def usersInstance = User.list()

        switch (request.getMethod()) {

            case "GET":
                renderThis(request.getHeader("Accept"), usersInstance)
                break;
            case "POST":
                def data= JSON.parse(request)

                userServService.createUser(data)
                render(status :response.status,text: 'User created')
                return response
                break;
            default:
                return response.status = 405
                break;
        }
        return response.status = 406
    }

    def renderThis(String acceptHeader, Object object) {
        switch (acceptHeader) {
            case 'xml':
            case 'text/xml':
            case 'application/xml':
                render object as XML
                break;
            case 'json':
            case 'text/json':
            case 'application/json':
                render object as JSON
                break;
        }
    }
}


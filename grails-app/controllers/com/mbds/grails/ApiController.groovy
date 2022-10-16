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
                break;
            case "PATCH":
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
                annonceServService.createAnnonce(data)
                return response
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
                break;
            case "PATCH":
                break;
            case "DELETE":
                userInstance.delete(flush:true)
                return response.status
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


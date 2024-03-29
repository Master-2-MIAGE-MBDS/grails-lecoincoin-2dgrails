package com.mbds.grails

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured('ROLE_ADMIN')
class UserController {

    UserService userService
    UserServService userServService

    static allowedMethods = [save: "POST", update: "PUT"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond userService.list(params), model:[userCount: userService.count()]
    }
    def ListeUsers(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond userService.list(params), model:[userCount: userService.count()]
    }

    def show(Long id) {
        respond userService.get(id)
    }

    def create() {
        respond new User(params)
    }

    def save(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            def userInstance = userService.save(user)
            def userRole
            if (params.role=='Administrator'){
                userRole = Role.findByAuthority('ROLE_ADMIN')
            }else if(params.role=='Advertiser'){
                userRole = Role.findByAuthority('ROLE_ADVERTISER')
            }
            UserRole.create(userInstance, userRole, true)
        } catch (ValidationException e) {
            respond user.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond userService.get(id)
    }

    def update(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            def userInstance=userService.save(user)

            if (params.deleteRole){
                user.getAuthorities().each {
                    UserRole.remove(userInstance,it)
                }
            }
            def userRole
            if (params.role=='Administrator'){
                userRole = Role.findByAuthority('ROLE_ADMIN')
                UserRole.create(userInstance, userRole, true)
            }else if(params.role=='Advertiser'){
                userRole = Role.findByAuthority('ROLE_ADVERTISER')
                UserRole.create(userInstance, userRole, true)
            }
        } catch (ValidationException e) {
            respond user.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        def userRoles= User.findById(id).getAuthorities()
        def user= User.findById(id)

        userRoles.each {
            Role.remove(user,it,true)
        }
        userService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action:"index", method:"GET", controller:'annonce'
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def find(){
        String toSearch=params.search
        def users= userServService.searchUser(toSearch)
        render view: "index", model: [userCount: users.size(),userList:users]
    }
}

package com.mbds.grails

import grails.gorm.transactions.Transactional

@Transactional
class UserServService {

    def serviceMethod() {

    }
    def createUser(data) {
        def us=new User(username:data.username,password:data.password,enabled: data.enabled,accountExpired: data.accountExpired,accountLocked: data.accountLocked,passwordExpired: data.passwordExpired).save(flush:true)
        def roles=data.roles
        roles.each{
            role->
                def userRole=Role.findByAuthority(role)
                UserRole.create(us, userRole, true)
        }
        return us
    }

    def updateUser(id,data) {
        def user= User.findById(id)
        if (data.password){
            user.password=data.password
        }
        if (data.username){
            user.username=data.username
        }
        def us=user.save(flush:true)
        if (data.roles){
            def userRoles= User.findById(id).getAuthorities()
            userRoles.each {
                Role.remove(user,it,true)
            }
            def roles=data.roles
            roles.each{
                role->
                    def userRole=Role.findByAuthority(role)
                    UserRole.create(us, userRole, true)
            }
        }
    }

    def deleteUser(id){
        def userRoles= User.findById(id).getAuthorities()
        def user= User.findById(id)

        userRoles.each {
            Role.remove(user,it,true)
        }
        user.delete()
    }

    List<User> searchUser(String search){
        User.findAllByUsernameIlike("%${search}%")
    }
}

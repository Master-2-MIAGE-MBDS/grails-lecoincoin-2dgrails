package com.mbds.grails

import grails.gorm.transactions.Transactional

@Transactional
class UserServService {

    def serviceMethod() {

    }
    def createUser(data) {

        def us=new User(username:'diallo',password:'diallo',enable: true,accountExpired: false,accountLocked: false,passwordExpired: false).save(flush:true)
        return us
    }

    List<User> searchUser(String search){
        User.findAllByUsernameIlike("%${search}%")
    }
}

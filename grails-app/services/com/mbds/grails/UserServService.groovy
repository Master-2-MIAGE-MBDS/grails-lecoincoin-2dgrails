package com.mbds.grails

import grails.gorm.transactions.Transactional

@Transactional
class UserServService {

    def serviceMethod() {

    }

    List<User> searchUser(String search){
        User.findAllByUsernameIlike("%${search}%")
    }
}

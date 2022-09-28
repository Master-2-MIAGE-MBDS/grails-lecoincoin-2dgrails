package com.mbds.grails

import grails.gorm.services.Service
import grails.gorm.transactions.Transactional

@Transactional
@Service(Annonce)
class AnnonceService {

    def list() {
        Annonce.list()
    }
}

package com.mbds.grails
import grails.gorm.services.Service
import grails.gorm.transactions.Transactional

@Transactional
@Service(Annonce)
class AnnonceServService {

    def createAnnonce(annonce) {
        new Annonce(title: annonce.title,description: annonce.description,price: annonce.price,active: annonce.active).save()
    }

    def searchAnnonce(String search){

    }
}

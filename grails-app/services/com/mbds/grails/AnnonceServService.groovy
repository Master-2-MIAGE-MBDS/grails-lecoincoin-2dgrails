package com.mbds.grails

import grails.gorm.transactions.Transactional

@Transactional
class AnnonceServService {

    def createAnnonce(annonce) {
        new Annonce(title: annonce.title,description: annonce.description,price: annonce.price,active: annonce.active).save()
    }

    List<Annonce> searchAnnonce(String search){
        Annonce.findAllByTitleIlikeOrDescriptionIlike("%${search}%","%${search}%")
    }

    Integer countAnnonce(List<Annonce> annonces){
        annonces.size()
    }
}

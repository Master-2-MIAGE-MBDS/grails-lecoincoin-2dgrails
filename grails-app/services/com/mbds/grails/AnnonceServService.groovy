package com.mbds.grails

import grails.gorm.transactions.Transactional
@Transactional
class AnnonceServService {

     def createAnnonce(data) {
         Float prix=60.3
       def an=new Annonce(title: 'datatitle2',description: 'data.description',price: prix,author: 1).save(flush:true)
         return an
    }

    List<Annonce> searchAnnonce(String search){
        Annonce.findAllByTitleIlikeOrDescriptionIlike("%${search}%","%${search}%")
    }

    Integer countAnnonce(List<Annonce> annonces){
        annonces.size()
    }
}

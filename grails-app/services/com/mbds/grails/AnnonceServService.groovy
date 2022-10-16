package com.mbds.grails

import grails.gorm.transactions.Transactional

import java.lang.reflect.Array

@Transactional
class AnnonceServService {

     Annonce createAnnonce(data) {
         Float prix=data.price
         def user = User.findByUsername(data.author)
         List files=[]
         def date= new Date().format('yymmddhhmmss')

         def encodedFiles=data.illustrations
         encodedFiles.each{
             file ->
             String decodedFile =file.replaceAll("\r", "")
                 decodedFile=decodedFile.replaceAll("\n", "")
                 decodedFile=decodedFile.decodeBase64()
                 def fileStore = new File(decodedFile+'.png')
                 fileStore.createNewFile()
                files.add(decodedFile+'.png')
         }
       def annonce=new Annonce(title: data.title,description: data.description,price: prix,active: data.active, author: user.id).save(flush:true)

         files.each {
             annonce.addToIllustrations(new Illustration(filename:it))
         }
         return annonce
    }

    List<Annonce> searchAnnonce(String search){
        Annonce.findAllByTitleIlikeOrDescriptionIlike("%${search}%","%${search}%")
    }

    Integer countAnnonce(List<Annonce> annonces){
        annonces.size()
    }
}

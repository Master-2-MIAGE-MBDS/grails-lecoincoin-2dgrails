package com.mbds.grails

import grails.gorm.transactions.Transactional
import org.grails.web.json.JSONArray

import java.lang.reflect.Array

@Transactional
class AnnonceServService {

     Annonce createAnnonce(data) {
         Float prix=data.price
         def user = User.findByUsername(data.author)
         List files=[]
         JSONArray illustrations = data.getJSONArray("illustrations")

         illustrations.eachWithIndex{
             illustration, index ->
                 def decoded = illustration.decodeBase64()
                 def date= new Date().format('yymmddhhmmss')
                 def filename = date + index + ".png"

                 new File(data.folder+filename).withOutputStream {
                     it.write(decoded)
                 }
                 files.add(filename)

         }

       def annonce=new Annonce(title: data.title,description: data.description,price: prix,active: data.active, author: user.id).save(flush:true)

         files.each {
             annonce.addToIllustrations(new Illustration(filename:it))
         }
         return annonce
    }

    Annonce updateAnnonce(id,data) {
        def annonce=Annonce.findById(id)
        if (data.title){
            annonce.title=data.title
        }
        if (data.price ){
            annonce.price= (Float) data.price
        }
        if (data.description ){
            annonce.description=data.description
        }
        if (data.active){
            annonce.active=data.active
        }
        if (data.author){
            def user=User.findByUsername(data.author)
            annonce.author.id=user.id
        }
        annonce.save(flush:true)
    }

    List<Annonce> searchAnnonce(String search){
        Annonce.findAllByTitleIlikeOrDescriptionIlike("%${search}%","%${search}%")
    }

    Integer countAnnonce(List<Annonce> annonces){
        annonces.size()
    }
}

package mbds_grails_22_23

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        //"/"(view:"/index")
        "/" ( controller:'annonce', action:'index' )
        "500"(view:'/error')
        "404"(view:'/notFound')
        "/admin/dashboard"(view: "/index")
    }
}

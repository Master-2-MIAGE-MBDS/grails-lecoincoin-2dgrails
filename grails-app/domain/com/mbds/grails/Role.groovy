package com.mbds.grails

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='authority')
@ToString(includes='authority', includeNames=true, includePackage=false)
class Role implements Serializable {

	private static final long serialVersionUID = 1

	String authority

	static constraints = {
		authority nullable: false, blank: false, unique: true
	}

	static boolean remove(User user, Role role, boolean flush = false) {
		UserRole userRole = UserRole.findByUserAndRole(user, role)
		return userRole ? userRole.delete(flush: flush) : false
	}

	static mapping = {
		cache true
	}
}

package dream_manager
import org.springframework.dao.DataIntegrityViolationException

class RoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [RoleInstanceList: Role.list(params), RoleInstanceTotal: Role.count()]
    }

    def create = {
        [RoleInstance: new Role(params)]
    }

    def save = {
        def RoleInstance = new Role(params)
        if (!RoleInstance.save(flush: true)) {
            render(view: "create", model: [RoleInstance: RoleInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'Role.label', default: 'Role'), RoleInstance.id])
        redirect(action: "show", id: RoleInstance.id)
    }

    def show = {
        def RoleInstance = Role.get(params.id)
        if (!RoleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'Role.label', default: 'Role'), params.id])
            redirect(action: "list")
            return
        }

        [RoleInstance: RoleInstance]
    }

    def edit = {
        def RoleInstance = Role.get(params.id)
        if (!RoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Role.label', default: 'Role'), params.id])
            redirect(action: "list")
            return
        }

        [RoleInstance: RoleInstance]
    }

    def update = {
        def RoleInstance = Role.get(params.id)
        if (!RoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Role.label', default: 'Role'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (RoleInstance.version > version) {
                RoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'Role.label', default: 'Role')] as Object[],
                          "Another user has updated this Role while you were editing")
                render(view: "edit", model: [RoleInstance: RoleInstance])
                return
            }
        }

        RoleInstance.properties = params

        if (!RoleInstance.save(flush: true)) {
            render(view: "edit", model: [RoleInstance: RoleInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'Role.label', default: 'Role'), RoleInstance.id])
        redirect(action: "show", id: RoleInstance.id)
    }

    def delete = {
        def RoleInstance = Role.get(params.id)
        if (!RoleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'Role.label', default: 'Role'), params.id])
            redirect(action: "list")
            return
        }

        try {
            RoleInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'Role.label', default: 'Role'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'Role.label', default: 'Role'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

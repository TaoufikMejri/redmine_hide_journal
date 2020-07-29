require_dependency 'journals_controller'

module RedmineHideJournal
  module JournalsControllerPatch
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)
    end

    module InstanceMethods
      def hide_journal
        journal = Journal.find params[:journal_id]
        journal.update_attributes(is_hidden: true) if User.current.admin? && params[:show] == 'false'
        journal.update_attributes(is_hidden: false) if User.current.admin? && params[:show] == 'true'
        redirect_to journal.issue
      end
    end
  end
end

JournalsController.send(:include, RedmineHideJournal::JournalsControllerPatch)

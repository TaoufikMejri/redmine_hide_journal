require_dependency 'journal'

module RedmineHideJournal
  module JournalPatch
    def self.included(base) # :nodoc:
      base.class_eval do
        # default_scope { where(is_hidden: false) }
        default_scope { User.current.admin? ? where(nil) : where(is_hidden: false) }
      end
    end
  end
end

Journal.send(:include, RedmineHideJournal::JournalPatch)

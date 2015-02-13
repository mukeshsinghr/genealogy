module Genealogy
  module UtilMethods
    extend ActiveSupport::Concern

    def is_female?
      return female? if respond_to?(:female?)
      sex == sex_female_value
    end

    def is_male?
      return male? if respond_to?(:male?)
      sex == sex_male_value
    end

    def birth
      self.send("#{genealogy_class.birth_date_column}").try(:to_date)
    end

    def death
      self.send("#{genealogy_class.death_date_column}").try(:to_date)
    end

    private

    def sex_to_s
      case sex
      when sex_male_value
        'male'
      when sex_female_value
        'female'
      else
        raise SexError, "Sex value not valid for #{self}"
      end
    end

  end
end
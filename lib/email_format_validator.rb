# -*- encoding: utf-8 -*-
require "uri"

class EmailFormatValidator < ActiveModel::EachValidator

  module Patterns
    def self.create_regexp(string)
      Regexp.new string, nil, 'n'
    end
    ATOM      = create_regexp "[^\\x00-\\x20\\x22\\x28\\x29\\x2c\\x2e\\x3a-\\x3c\\x3e\\x40\\x5b-\\x5d\\x7f-\\xff]+"
    QTEXT     = create_regexp "[^\\x0d\\x22\\x5c\\x80-\\xff]"
    QPAIR     = create_regexp "\\x5c[\\x00-\\x7f]"
    QSTRING   = create_regexp "\\x22(?:#{QTEXT}|#{QPAIR})*\\x22"
    WORD      = create_regexp "(?:#{ATOM}|#{QSTRING})"
    LOCAL_PT  = create_regexp "#{WORD}(?:\\x2e#{WORD})*"
    ADDRESS   = create_regexp "#{LOCAL_PT}\\x40#{URI::REGEXP::PATTERN::HOSTNAME}"

    EMAIL    = /\A#{ADDRESS}\z/
  end

  def validate_each(record, attribute, value)
    unless value =~ Patterns::EMAIL
      record.errors[attribute] << (options[:message] || "is not formatted properly")
    end
  end

end
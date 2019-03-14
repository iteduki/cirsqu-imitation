# frozen_string_literal: true

class Role < ActiveYaml::Base
  include ActiveHash::Associations
  include ActiveHash::Enum

  set_root_path Rails.root.join('config/models/')
  set_filename name.underscore

  enum_accessor :key
end

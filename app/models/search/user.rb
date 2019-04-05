# frozen_string_literal: true

class Search::User
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :keyword, :string, default: ''

  def matches
    result = base_criteria
    if keyword.present?
      result = keyword.split(/[[:blank:]]/).inject(result) do |res, k|
        res = res.keyword_like(k)
      end
    end
    result
  end

  private

  def base_criteria
    ::User
  end
end

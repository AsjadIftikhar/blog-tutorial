module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = %w[public private archived]

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  class_methods do
    def get_status_list
      VALID_STATUSES
    end
  end

  def archived?
    status == 'archived'
  end
end


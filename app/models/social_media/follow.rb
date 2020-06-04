module SocialMedia
  class Follow < ApplicationRecord
    include SocialMedia::SocialMediaHelper

    belongs_to :target, polymorphic: true
    belongs_to :owner, polymorphic: true


    before_validation :raise_already_liked_error_if_required, on: :create
    before_validation :raise_not_implemented_error_if_required, on: :create
    before_commit :increment_number_of_follows, on: :create
    before_destroy :decrement_number_of_follows

    validates :target_id, uniqueness: {scope: %i[target_type owner_id owner_type], message: "has already been followed."}


    private

    def increment_number_of_follows
      raise_not_implemented_error_if_requried

      update_count(:number_of_follows, :+)
    end

    def decrement_number_of_follows
      raise_not_implemented_error_if_requried

      update_count(:number_of_follows, :-)
    end

    private

    def raise_already_followd_error_if_required
      raise SocialMedia::Follows::AlreadyExistsError.new("#{owner_type} has already followd that #{target_type}") if owner.followable_objects.exists?(target: target)
    end
  end
end

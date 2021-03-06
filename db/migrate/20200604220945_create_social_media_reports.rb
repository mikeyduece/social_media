class CreateSocialMediaConcernsReports < ActiveRecord::Migration[6.0]
  def change
    create_table :social_media_concerns_reports do |t|
      t.references :target, polymorphic: true
      t.references :owner, polymorphic: true

      t.timestamps
    end

    add_index :social_media_concerns_reports, %i[target_id target_type owner_id owner_type], unique: true, name: :idx_social_media_concerns_reports_on_owner_and_target
  end
end

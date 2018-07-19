module WPDB
  class MyrpCommentRating < Sequel::Model(:"#{WPDB.prefix}myrp_ratings")
    many_to_one :comment, class: :'WPDB::Comment'
  end
end

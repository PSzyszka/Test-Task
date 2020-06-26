# frozen_string_literal: true

module Posts
  class FetchService
    MAX_LIMIT = 100

    def self.call(page_number, page_limit, max_limit = MAX_LIMIT)
      new.call(page_number, page_limit)
    end

    def call(page_number, page_limit, max_limit = MAX_LIMIT)
      return [] if page_number <= 0 || page_limit < 0

      page_limit = select_page_limit(page_limit, max_limit)
      posts = select_posts(page_number, page_limit)
      map_posts(posts)
    end

    private

    def select_page_limit(limit, max_limit)
      limit >= max_limit ? max_limit : limit
    end

    def select_posts(page_number, page_limit)
      posts = Post.includes(comments: :author)
                  .joins(:comments)
                  .where('posts.published_at <= ?', DateTime.now)
                  .merge(Comment.where(removed: false))
                  .order(published_at: :desc)
                  .distinct
                  .limit(page_limit)
                  .offset(page_limit * (page_number - 1))
    end

    def map_posts(posts)
      posts.map do |post|
        {
          id: post.id,
          title: post.title,
          body: post.body,
          comments: map_comments(post.comments)
        }
      end
    end

    def map_comments(comments)
      comments.map do |comment|
        {
          id: comment.id,
          body: comment.body,
          first_name: comment.author.first_name,
          last_name: comment.author.last_name
        }
      end
    end
  end
end

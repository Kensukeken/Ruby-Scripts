require 'faraday'
require 'json'

class ApiClient
  def initialize(base_url)
    @client = Faraday.new(url: base_url) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end

  # Perform a GET request
  def get(path, params = {})
    response = @client.get(path, params)
    parse_response(response)
  end

  # Perform a POST request
  def post(path, payload = {})
    response = @client.post(path) do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = payload.to_json
    end
    parse_response(response)
  end

  # Perform a PUT request
  def put(path, payload = {})
    response = @client.put(path) do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = payload.to_json
    end
    parse_response(response)
  end

  # Perform a DELETE request
  def delete(path)
    response = @client.delete(path)
    parse_response(response)
  end

  # Handle response parsing
  def parse_response(response)
    case response.status
    when 200
      JSON.parse(response.body)
    when 404
      { error: 'Not Found' }
    else
      { error: 'Unknown Error', status: response.status }
    end
  end

  # Example method to fetch user data
  def fetch_user(user_id)
    get("/users/#{user_id}")
  end

  # Example method to create a new user
  def create_user(user_data)
    post('/users', user_data)
  end

  # Example method to update user data
  def update_user(user_id, user_data)
    put("/users/#{user_id}", user_data)
  end

  # Example method to delete a user
  def delete_user(user_id)
    delete("/users/#{user_id}")
  end

  # Example method to fetch all users
  def fetch_all_users
    get('/users')
  end

  # Example method to fetch posts
  def fetch_posts
    get('/posts')
  end

  # Example method to fetch a specific post
  def fetch_post(post_id)
    get("/posts/#{post_id}")
  end

  # Example method to create a new post
  def create_post(post_data)
    post('/posts', post_data)
  end

  # Example method to update a post
  def update_post(post_id, post_data)
    put("/posts/#{post_id}", post_data)
  end

  # Example method to delete a post
  def delete_post(post_id)
    delete("/posts/#{post_id}")
  end

  # Example method to fetch comments for a post
  def fetch_comments(post_id)
    get("/posts/#{post_id}/comments")
  end

  # Example method to create a comment for a post
  def create_comment(post_id, comment_data)
    post("/posts/#{post_id}/comments", comment_data)
  end

  # Example method to update a comment
  def update_comment(post_id, comment_id, comment_data)
    put("/posts/#{post_id}/comments/#{comment_id}", comment_data)
  end

  # Example method to delete a comment
  def delete_comment(post_id, comment_id)
    delete("/posts/#{post_id}/comments/#{comment_id}")
  end

  # Example method to fetch all categories
  def fetch_categories
    get('/categories')
  end

  # Example method to fetch a specific category
  def fetch_category(category_id)
    get("/categories/#{category_id}")
  end

  # Example method to create a new category
  def create_category(category_data)
    post('/categories', category_data)
  end

  # Example method to update a category
  def update_category(category_id, category_data)
    put("/categories/#{category_id}", category_data)
  end

  # Example method to delete a category
  def delete_category(category_id)
    delete("/categories/#{category_id}")
  end

  # Example method to fetch tags
  def fetch_tags
    get('/tags')
  end

  # Example method to fetch a specific tag
  def fetch_tag(tag_id)
    get("/tags/#{tag_id}")
  end

  # Example method to create a new tag
  def create_tag(tag_data)
    post('/tags', tag_data)
  end

  # Example method to update a tag
  def update_tag(tag_id, tag_data)
    put("/tags/#{tag_id}", tag_data)
  end

  # Example method to delete a tag
  def delete_tag(tag_id)
    delete("/tags/#{tag_id}")
  end

  # Example method to fetch all likes
  def fetch_likes
    get('/likes')
  end

  # Example method to fetch likes for a specific post
  def fetch_post_likes(post_id)
    get("/posts/#{post_id}/likes")
  end

  # Example method to like a post
  def like_post(post_id)
    post("/posts/#{post_id}/likes")
  end

  # Example method to unlike a post
  def unlike_post(post_id)
    delete("/posts/#{post_id}/likes")
  end

  # Example method to fetch all followers
  def fetch_followers
    get('/followers')
  end

  # Example method to fetch followers for a specific user
  def fetch_user_followers(user_id)
    get("/users/#{user_id}/followers")
  end

  # Example method to follow a user
  def follow_user(user_id)
    post("/users/#{user_id}/followers")
  end

  # Example method to unfollow a user
  def unfollow_user(user_id)
    delete("/users/#{user_id}/followers")
  end
end

# Usage
client = ApiClient.new('https://jsonplaceholder.typicode.com')
puts client.fetch_user(1)
puts client.fetch_all_users
puts client.fetch_posts
puts client.fetch_post(1)
puts client.fetch_comments(1)
puts client.fetch_categories
puts client.fetch_tags
puts client.fetch_likes
puts client.fetch_post_likes(1)
puts client.fetch_followers
puts client.fetch_user_followers(1)

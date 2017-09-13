class BlogController < ApplicationController
  caches_page :index, :show
  before_action :set_article, only: [:show]

  def index
    set_page_metadata(:blog)
    articles
    @categories = ArticleCategory.joins(:articles).where(articles: {published: 't'}).uniq

    @other_articles_count = Article.published.where("article_category_id is null").count
    @show_other_category = @other_articles_count > 0
    @all_count = @articles.count
    @show_all = (@show_other_category && @categories.count > 0) || (@categories.count > 1)
  end

  def show
    set_page_metadata(@article)
    @related_articles = Article.published.where.not(id: @article.id)

    @og_image = @article.avatar.url
    add_breadcrumb(:blog, blog_path)
    add_breadcrumb(@article)
  end

  def articles
    @articles ||= Article.published
  end

  def set_article
    @article = Article.get(params[:id])
    if @article.nil?
      return render_not_found
    end
  end
end
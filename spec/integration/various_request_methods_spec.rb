# coding: utf-8
require 'spec_helper'

describe 'advanced crawler setup' do
  it "should crawl page with POST request method" do
    VCR.use_cassette('advanced_crawler_page') do
      crawler = Class.new
      crawler.send(:include, Wombat::Crawler)

      crawler.base_url "http://www.github.com"
      crawler.path "/"

      crawler.request do
        http_method :post
        http_headers {}
      end

      crawler.headline xpath: "//h1"
      crawler.subheading css: "p.subheading"

      crawler.what_is({ css: ".teaser h3" }, :list)

      crawler_instance = crawler.new

      results = crawler_instance.crawl
    end
  end
end

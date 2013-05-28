# coding: utf-8
require 'spec_helper'

describe 'advanced crawler setup' do
  it "should crawl page with POST request method" do
    VCR.use_cassette('advanced_crawler_page') do
      crawler = Class.new
      crawler.send(:include, Wombat::Crawler)

      crawler.base_url "http://www.centpart.ru"
      crawler.path "/new-media/select"

      crawler.request do
        http_method :post
        http_headers({'Host' => 'www.centpart.ru', 'Accept-Language' => 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', 'X-Requested-With' => 'XMLHttpRequest'})
        http_parameters do
          page "2"
        end
      end

      crawler.videos "css=.ticket", :iterator do
        id "xpath=@data-film_id"
        data do
          title "xpath=div[@class='descr']//b//a"
          path "xpath=div[@class='descr']//b//a/@href"
        end
      end

      crawler_instance = crawler.new

      results = crawler_instance.crawl
      puts results
    end
  end
end

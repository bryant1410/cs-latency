import scrapy

class BlogSpider(scrapy.Spider):
    name = 'gametracker'
    start_urls = [f'https://www.gametracker.com/search/cs/?&searchipp=50&searchpge={page}#search' for page in range(1, 221)]

    def parse(self, response):
        for ip_class in response.css('.ip'):
            yield {"ip": ip_class.css('::text').get()}  # .text().split(":")[0]

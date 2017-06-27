module GemSearchHelper

    def self.search(gem)
        begin
            Gems.info gem
        rescue
            show = {'search' => "no result",
                    'name' => gem,
                    'message' => "Oh no! Looks like that gem can’t be found."
                }
        end
    end

    def self.title_info(result)
        show = Hash.new
        show['name'] = result['name']
        show['url'] = result['project_uri']
        show
    end

    def self.gem_detilas(result)
        show = Hash.new
        show['information'] = result['info']
        show
    end

    def self.get_dependencies(result)
        show = result['dependencies']['development']

        show.each do |dependent|
            dependent['url'] = 'https://rubygems.org/gems/' + dependent['name']
        end
        show
    end

    def self.append_url(array)
        show = []
        array.each do |gem_name|
            url = 'https://rubygems.org/gems/' + gem_name
            gem = {'name'=> gem_name, 'url'=> url }
            show.push(gem)
        end
        show 
    end

end

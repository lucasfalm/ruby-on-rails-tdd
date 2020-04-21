describe 'Cassette', :cassette do
    it 'save in cassette', vcr: {cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body]} do
        response = HTTParty.get("https://jsonplaceholder.typicode.com/posts")
        content_type = response.headers['content-type'] 
        expect(content_type).to match(/application\/json/)       
    end
end
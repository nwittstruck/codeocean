def expect_assigns(pairs)
  pairs.each_pair do |key, value|
    it "assigns @#{key}" do
      if value.is_a?(Class)
        expect(assigns(key)).to be_a(value)
      else
        object = value.is_a?(Symbol) ? send(value) : value
        if object.is_a?(ActiveRecord::Relation) || object.is_a?(Array)
          expect(assigns(key)).to match_array(object)
        else
          expect(assigns(key)).to eq(object)
        end
      end
    end
  end
end

def expect_content_type(content_type)
  it "responds with content type '#{content_type}'" do
    expect([response.content_type, response.headers['Content-Type']]).to include(content_type)
  end
end

def expect_flash_message(type, message)
  it 'displays a flash message' do
    expect(flash[type]).to eq(message.is_a?(String) ? message : I18n.t(message))
  end
end

def expect_redirect(path = nil)
  if path
    it "redirects to #{path}" do
      expect(controller).to redirect_to(path)
    end
  else
    it 'performs a redirect' do
      expect(response).to be_redirect
    end
  end
end

def expect_status(status)
  it "responds with status #{status}" do
    expect(response.status).to eq(status)
  end
end

def expect_template(template)
  it "renders the '#{template}' template" do
    expect(controller).to render_template(template)
  end
end
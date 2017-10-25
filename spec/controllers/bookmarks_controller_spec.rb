require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  let!(:bookmark) { create(:bookmark) }

  describe 'GET index' do
    subject { get :index }

    it { is_expected.to have_http_status(:success) }
  end

  describe 'GET show' do
    subject { get :show, params: { id: bookmark.id } }

    it { is_expected.to have_http_status(:success) }
  end

  describe 'GET new' do
    subject { get :new }

    it { is_expected.to have_http_status(:success) }
  end

  describe 'GET edit' do
    subject { get :edit, params: { id: bookmark.id } }

    it { is_expected.to have_http_status(:success) }
  end

  describe 'POST create' do


    subject(:request) { post :create, params: params }

    context 'with correct params' do
      let(:params) do
        {
          bookmark: {
            title: Faker::Name.title,
            url: Faker::Internet.url,
            shortening: Faker::TwinPeaks.quote,
            tag_list: Faker::Lorem.words
          }
        }
      end

      it { is_expected.to redirect_to(bookmark_path(Bookmark.last)) }

      it 'creates new bookmark' do
        expect{ request }.to change{ Bookmark.count }.by(1)
      end
    end

    context 'with empty params' do
      let(:params) { {} }

      it { is_expected.not_to redirect_to(bookmark_path(Bookmark.last)) }
    end
  end

  describe 'PATCH update' do
    let(:new_title) { 'new title' }

    subject(:request) { patch :update, params: params }

    context 'with correct params' do
      let(:params) do
        {
          bookmark: {
            title: new_title
          },
          id: bookmark.id
        }
      end

      it { is_expected.to redirect_to(bookmark_path(bookmark)) }

      it 'updates existing bookmark' do
        expect{ request }.to change{ bookmark.reload.title }.to(new_title)
      end
    end

    context 'with incorrect params' do
      let(:params) do
        {
          id: bookmark.id,
          bookmark: {
            url: ''
          }
        }
      end

      it { is_expected.not_to redirect_to(bookmark_path(bookmark)) }
    end
  end

  describe 'DELETE destroy' do
    let(:params) { { id: bookmark.id } }
    subject(:request) { delete :destroy, params: params }

    it { is_expected.to redirect_to(bookmarks_url) }

    it 'deletes a bookmark' do
      expect{ request }.to change{ Bookmark.count }.by(-1)
    end
  end
end

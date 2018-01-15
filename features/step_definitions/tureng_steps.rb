Given(/^I visit tureng main page$/) do
  visit 'http://www.tureng.com'
  expect(page).to have_selector('#searchTerm')
end

When(/^I try to translate "([^"]*)" from Turkish to English$/) do |turkish_term|
  search_area = find_by_id('searchTerm')
  search_area.set turkish_term
  find('.btn-turengsearch').click
end

Then(/^One of the translations should include "([^"]*)"$/) do |translation|
  translations = find_by_id('englishResultsTable', match: :first)
  expect(translations).to have_text /#{translation}/i
end
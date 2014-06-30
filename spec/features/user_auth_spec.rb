require 'spec_helper'
require 'capybara/rspec'

feature 'Homepage' do

  scenario 'User can register' do
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: 'branwyn@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content 'Welcome to the lending library branwyn@example.com'
  end

  scenario 'User can logout' do
    email_address = 'branwyn@example.com'
    welcome_message = "Welcome to the lending library #{email_address}"
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: email_address
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content(welcome_message)
    click_on 'Log out'
    expect(page).to_not have_content(welcome_message)

  end

  scenario 'User can login with registered email and password' do
    email_address = 'branwyn@example.com'
    password = 'password'
    welcome_message = "Welcome to the lending library #{email_address}"
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: email_address
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_on 'Sign up'
    click_on 'Log out'
    click_on 'Log in'
    fill_in 'Email', with: email_address
    fill_in 'Password', with: password
    click_on 'Log in'
    expect(page).to have_content(welcome_message)
  end

  scenario 'User cannot login if their email address does not exist' do
    pending
    email_address = 'branwyn@example.com'
    password = '123456'
    visit '/'
    click_on 'Log in'
    fill_in 'Email', with: email_address
    fill_in 'Password', with: password
    click_on 'Log in'
    expect(page).to have_content 'Email / password is invalid'
  end

  scenario 'User cannot sign in with an invalid email and/or password' do
    pending
    email_address = 'branwyn@example.com'
    password = '123456'
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: email_address
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_on 'Sign up'
    click_on 'Log out'
    click_on 'Log in'
    fill_in 'Email', with: email_address
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    expect(page).to have_content 'Email / password is invalid'
  end

end

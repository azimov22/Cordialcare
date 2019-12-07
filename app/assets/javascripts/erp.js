//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require select2
//= require semantic-ui/dropdown
//= require jquery-mask-plugin

$.jMaskGlobals.watchDataMask = true;

$.ajaxSetup({
    headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
});

$(document).on('turbolinks:load', function() {
    $('.select').select2({language: "ru"});
    $('.dropdown').dropdown();
    $('#standard_calendar').calendar({ ampm: false });
    $('#standard_calendar_1').calendar({ ampm: false });
});

function(el, x, choices) {
  
  console.log(choices);
  
  let myMap = this;
  
  let cbsa_code = choices.metro_choices.cbsa_code,
      cbsa_title = choices.metro_choices.cbsa_title,
      cbsa_lat = choices.metro_choices.cbsa_lat,
      cbsa_lng = choices.metro_choices.cbsa_lng,
      univ_id = choices.univ_choices.univ_id,
      univ_name = choices.univ_choices.univ_name;
      
  // buttons
  
  $('.easy-button-button').css('width', 'auto');
  $('.easy-button-button .button-state .fa').css({'float': 'left', 'margin-top': '10px'});
  
  $('button[title="Toggle View"] .button-state').append('<span id="view-btn" style="display: inline-block; float: left; padding-left: 5px;">National View</span>');
  $('button[title="Select Metro Area"] .button-state').append('<span style="display: inline-block; float: left; padding-left: 5px;">Select Metro Area</span>');
  $('button[title="Select University"] .button-state').append('<span style="display: inline-block; float: left; padding-left: 5px;">Select University</span>');
  
  // metro selection options
  
  let metroControlHTML = '<div id="metro-control" class="leaflet-control-layers leaflet-control leaflet-control-layers-expanded custom-control" style="width: 280px; height: 100px; overflow-y: scroll;">';
  
  cbsa_title.forEach(function(curr, idx) {
    metroControlHTML += '<div><input type="radio" class="leaflet-control-layers-selector" name="metro-choice" data-cbsa="' + cbsa_code[idx] + '" data-lat="' + cbsa_lat[idx] + '" data-lng="' + cbsa_lng[idx] + '"><span> ' + curr + '</span></div>';
  });
    
  metroControlHTML += '</div>';
  
  $('button[title="Select Metro Area"]').parent().after(metroControlHTML);
    
  // univ selection options
  
  let univControlHTML = '<div id="univ-control" class="leaflet-control-layers leaflet-control leaflet-control-layers-expanded custom-control" style="width: 280px; height: 100px; overflow-y: scroll;">';
  
  univ_name.forEach(function(curr, idx) {
    univControlHTML += '<div><input type="radio" class="leaflet-control-layers-selector" name="univ-choice" data-ipeds="' + univ_id[idx] + '"><span> ' + curr + '</span></div>';
  });
    
  univControlHTML += '</div>';
  
  $('button[title="Select University"]').parent().after(univControlHTML);
    
  // selection text
  
  selTextHTML = '<div id="selection-text" style="padding: 10px; display: inline-block; font-weight: 900; color: #444;"></div>';
  
  $('.leaflet > .leaflet-control-container > .leaflet-top.leaflet-left').append(selTextHTML);
    
  // handle metro selection
    
  $('input[name="metro-choice"]').on('change', function(e) {
    let $this = $(this);
    
    let metro = $this.attr('data-cbsa'),
        lat = $this.attr('data-lat'),
        lng = $this.attr('data-lng');
        
    active_attr.active_metro = metro;
    set_active_metro();
    
    myMap.setView([lat, lng], 8.2);
    
    $('button[title="Toggle View"]').attr('data-national', false);
    $('#view-btn').html('National View');
    
    update_sel_text();
    
    reset_overlays();
    // reset_overlays_income();
    // reset_overlays_race();
  });
  
  let set_active_metro = function() {
    $('.metro-shape').css('display', 'none');
    $('.metro-' + active_attr.active_metro).css('display', 'inherit');
  };
  
  // handle univ selection
    
  $('input[name="univ-choice"]').on('change', function(e) {
    let $this = $(this);
    
    let ipeds = $this.attr('data-ipeds');
        
    active_attr.active_univ = ipeds;
    set_active_univ();
    
    update_sel_text();
  });
  
  let set_active_univ = function() {
    
    // hide all pins
    $('.univ-pin, div[title^="univ-pin"]').css('display', 'none');

    // display only active univ's pins
    $('div[title^="univ-pin-' + active_attr.active_univ + '"]').css('display', 'inherit');
    
    $('.univ-' + active_attr.active_metro + '-' + active_attr.active_univ).css('display', 'inherit');
    $('.univ-shared-' + active_attr.active_metro).css('display', 'inherit');

  };
  
  // handle selection text update
  
  let update_sel_text = function() {
    let sel_text = $('input[data-ipeds="' + active_attr.active_univ + '"]').next().text() + ' in ' + $('input[data-cbsa="' + active_attr.active_metro + '"]').next().text();
    $('#selection-text').text(sel_text);
  };
  
  // handle overlays/pins selection

  myMap.on('baselayerchange', function(e) {
    $('.legend').css('display', 'none');
    switch (e.name) {
      case 'MSA by Median Household Income':
        $('.legend-income').css('display', 'inherit');
        break;
      case 'MSA by Population Total':
        $('.legend-pop').css('display', 'inherit');
        break;
      case 'MSA by Race/Ethnicity':
        $('.legend-race').css('display', 'inherit');
        break;
    }
    e.layer.bringToBack();
    set_active_metro();
  });
  
  myMap.on('overlayadd', function(e) {
    set_active_univ();
  });
  
  let reset_overlays = function() {
    // $('input[name=leaflet-base-layers]').first().trigger('click');
    
    $('.leaflet-control-layers-overlays .leaflet-control-layers-selector').each(function(e) {
      let $this = $(this);
      if ($this.prop('checked')) {
        $this.trigger('click');
      }
    });
    
    // Check public HS visit + nonvisit
    $('.leaflet-control-layers-overlays .leaflet-control-layers-selector').first().trigger('click');
    $('.leaflet-control-layers-overlays .leaflet-control-layers-selector').eq(1).trigger('click');
  };
  
  let reset_overlays_income = function() {
    $('.leaflet-control-layers-base .leaflet-control-layers-selector').eq(1).trigger('click');
  };
  
  let reset_overlays_race = function() {
    $('.leaflet-control-layers-base .leaflet-control-layers-selector').eq(3).trigger('click');
  };
  
  // default settings on load
      
  let active_attr = {
    active_metro: '16980',  // default metro: Chicago
    active_univ: '215293'  // default univ: University of Pittsburgh
  };
  
  $('.legend, .awesome-marker-shadow, #metro-control, #univ-control').css('display', 'none');
  
  $('input[data-cbsa="' + active_attr.active_metro + '"]').trigger('click');
  $('input[data-ipeds="' + active_attr.active_univ + '"]').trigger('click');

}

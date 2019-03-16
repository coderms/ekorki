$("#ogloszenie_pon").click(function() { toggleDropdown(this, '#dropdown-pon'); });
$("#ogloszenie_wt").click(function() { toggleDropdown(this, '#dropdown-wt'); });
$("#ogloszenie_sr").click(function() { toggleDropdown(this, '#dropdown-sr'); });
$("#ogloszenie_czw").click(function() { toggleDropdown(this, '#dropdown-czw'); });
$("#ogloszenie_pt").click(function() { toggleDropdown(this, '#dropdown-pt'); });
$("#ogloszenie_sob").click(function() { toggleDropdown(this, '#dropdown-sob'); });
$("#ogloszenie_nie").click(function() { toggleDropdown(this, '#dropdown-nie'); });

$("#dropdown-pon").next().children(".dropdown-item").click(function() { 
		selectFromDropdown(this, "#dropdown-pon");
		saveValue(this, "#ogloszenie_pon_time");
	});
$("#dropdown-wt").next().children(".dropdown-item").click(function() { 
		selectFromDropdown(this, "#dropdown-wt");
		saveValue(this, "#ogloszenie_wt_time");
	});
$("#dropdown-sr").next().children(".dropdown-item").click(function() { 
		selectFromDropdown(this, "#dropdown-sr");
		saveValue(this, "#ogloszenie_sr_time");
	});
$("#dropdown-czw").next().children(".dropdown-item").click(function() {
		selectFromDropdown(this, "#dropdown-czw");
		saveValue(this, "#ogloszenie_czw_time");
	});
$("#dropdown-pt").next().children(".dropdown-item").click(function() {
		selectFromDropdown(this, "#dropdown-pt");
		saveValue(this, "#ogloszenie_pt_time");
	});
$("#dropdown-sob").next().children(".dropdown-item").click(function() {
		selectFromDropdown(this, "#dropdown-sob");
		saveValue(this, "#ogloszenie_sob_time");
	});
$("#dropdown-nie").next().children(".dropdown-item").click(function() {
		selectFromDropdown(this, "#dropdown-nie");
		saveValue(this, "#ogloszenie_nie_time");
	});

function selectFromDropdown(item, comp_id) {
	$(comp_id).text($(item).text());
}

function saveValue(item, comp_id) {
	$(comp_id).val($(item).text());
}

function toggleDropdown(comp, id) {
    if($(comp).is(":checked")) {
		$(id).attr('disabled', false);
    } else {
    	$(id).attr('disabled', true);
    }
}

// Initial values
var isPonChecked = $("#ogloszenie_pon").is(":checked");
$('#dropdown-pon').attr('disabled', !isPonChecked);

var isWtChecked = $("#ogloszenie_wt").is(":checked");
$('#dropdown-wt').attr('disabled', !isWtChecked);

var isSrChecked = $("#ogloszenie_sr").is(":checked");
$('#dropdown-sr').attr('disabled', !isSrChecked);

var isCzwChecked = $("#ogloszenie_czw").is(":checked");
$('#dropdown-czw').attr('disabled', !isCzwChecked);

var isPtChecked = $("#ogloszenie_pt").is(":checked");
$('#dropdown-pt').attr('disabled', !isPtChecked);

var isSobChecked = $("#ogloszenie_sob").is(":checked");
$('#dropdown-sob').attr('disabled', !isSobChecked);

var isNieChecked = $("#ogloszenie_nie").is(":checked");
$('#dropdown-nie').attr('disabled', !isNieChecked);

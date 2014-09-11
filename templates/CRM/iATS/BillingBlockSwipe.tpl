{*
 Extra fields for iATS secure SWIPE
*}

<div id="iats-swipe">
      <div class="crm-section cad-instructions-section">
        <div class="label"><em>{ts domain='com.iatspayments.civicrm'}Get ready to SWIPE! Place your cursor in the Encrypted field below and swipe card.{/ts}</em></div>
        <div class="content"><img width=220 height=220 src="{crmResURL ext=com.iatspayments.civicrm file=templates/CRM/iATS/usb_reader.jpg}"></div>
        <div class="clear"></div>
      </div>
      <div class="crm-section encrypted-credit-card-section">
        <div class="label">{$form.encrypted_credit_card_number.label}</div>
        <div class="content">{$form.encrypted_credit_card_number.html}</div>
        <div class="clear"></div>
      </div>
</div>

<script type="text/javascript">
{literal}

function iatsSetCreditCardNumber() {
  var bin = cj('#encrypted_credit_card_number').val();
  console.log('bin: '+bin);
  if (bin.charAt(0) == '0') {
    /* if 0 -> IDTech -> prefix = 00|@| */
    var withprefix = "00|@|"+bin;
    cj('#credit_card_number').val(withprefix);
    console.log('withprefix: '+withprefix);
  }
  if (bin.charAt(0) == '%') {
    /* if % -> MagTek -> prefix = 02|@| */
    var withprefix = "02|@|"+bin;
    cj('#credit_card_number').val(withprefix);
    console.log('withprefix: '+withprefix);
  }
}

function clearField() {
  var field = cj('#encrypted_credit_card_number').val();
  /* console.log('field: '+field); */
  if (field == 'click here - then swipe') {
    cj('#encrypted_credit_card_number').val('');
    }
}

cj( function( ) {
  /* move my custom fields up where they belong */
  cj('#payment_information').prepend(cj('#iats-swipe'));

  /* hide the credit card number field */
  cj('.credit_card_number-section').hide();
  cj('.credit_card_type-section').hide();
  cj('.cvv2-section').hide();

  /* cj('.credit_card_info-group').hide(); */
  cj('.billing_name_address-group').hide();

  iatsSetCreditCardNumber();

  var defaultValue = 'click here - then swipe';
  cj('#encrypted_credit_card_number').val(defaultValue);
  cj('#encrypted_credit_card_number').focus(clearField);
  cj('#encrypted_credit_card_number').blur(iatsSetCreditCardNumber);

});

{/literal}
</script>

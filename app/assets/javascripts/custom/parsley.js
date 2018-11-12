$(function() {
  $('form.parsley').parsley({
    'errorsWrapper': '<ul class="parsley-error-list"></ul>',
    'errorTemplate': '<li class="parsley-error-item"></li>',
    'excluded': 'input[type=button],' +
              'input[type=submit],' +
              'input[type=reset],' +
              '[disabled]',
    'inputs': 'input, textarea, select, :hidden',
    'trigger': 'change',
    'successClass': ''
  });
});

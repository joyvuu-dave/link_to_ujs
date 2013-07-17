(function ($, undefined) {
    /**
     * link_to_ujs
     * https://github.com/gagoar/link_to_ujs
    **/
  'use strict';

    var LinkToUjs;
    $.LinkToUjs = LinkToUjs = {
      selector: 'a[data-ujs][data-ref]'
      , codeStorage: {}
      , onClick: function(e){
          e.preventDefault()
          var $el = $(this)
            , ref = $el.data('ref')
            , code = $.LinkToUjs.codeStorage[ref]

          if(ref){
            if( typeof $.LinkToUjs.codeStorage[ref] !== 'function' )
              $.LinkToUjs.codeStorage[ref] = new Function(e,code)

            $.LinkToUjs.codeStorage[ref](e)
          }
      }
      , bind: function(){
        $(document).on('click', this.selector, this.onClick);
      }
    }
    $(function () {
        $.LinkToUjs.bind();
    });
})(jQuery);

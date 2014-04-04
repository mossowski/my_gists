(function() {
  jQuery(function() {
    var hash, loading_posts, page_regexp, pushPage;
    page_regexp = /\d+$/;
    pushPage = function(page) {
      History.pushState(null, "Page " + page, "?page=" + page);
    };
    window.preparePagination = function(el) {
      el.waypoint(function(direction) {
        var $this, page, page_el;
        $this = $(this);
        if (!($this.hasClass('first-page') && direction === 'up')) {
          page = parseInt($this.data('page'), 10);
          if (direction === 'up') {
            page -= 1;
          }
          page_el = $($('#static-pagination li').get(page));
          if (!page_el.hasClass('active')) {
            $('#static-pagination .active').removeClass('active');
            pushPage(page);
            return page_el.addClass('active');
          }
        }
      });
    };
    hash = window.location.hash;
    if (hash.match(/page=\d+/i)) {
      window.location.hash = '';
      window.location.search = '?page=' + hash.match(/page=(\d+)/i)[1];
    }
    if ($('#infinite-scrolling').size() > 0) {
      preparePagination($('.page-delimiter'));
      $(window).bindWithDelay('scroll', function() {
        var more_posts_url;
        more_posts_url = $('#infinite-scrolling .next_page a').attr('href');
        if (more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
          $('#infinite-scrolling .pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />');
          $.getScript(more_posts_url, function() {
            return pushPage(more_posts_url.match(page_regexp)[0]);
          });
        }
      }, 100);
    }
    if ($('#with-button').size() > 0) {
      preparePagination($('.page-delimiter'));
      $('#with-button .pagination').hide();
      loading_posts = false;
      $('#load_more_posts').show().click(function() {
        var $this, more_posts_url;
        if (!loading_posts) {
          loading_posts = true;
          more_posts_url = $('#with-button .next_page a').attr('href');
          if (more_posts_url) {
            $this = $(this);
            $this.html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />').addClass('disabled');
            $.getScript(more_posts_url, function() {
              if ($this) {
                $this.text('More posts').removeClass('disabled');
              }
              pushPage(more_posts_url.match(page_regexp)[0]);
              return loading_posts = false;
            });
          }
        }
      });
    }
  });

}).call(this);

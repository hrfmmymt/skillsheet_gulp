vAlignDesc = ->
  descHeight = $('section.desc').height()
  wrapperHeight = $('section.desc div.wrapper').height()
  $('section.desc div.wrapper').css top: (descHeight / 2) - (wrapperHeight / 2)
  return
$ ->
  $('section.desc').onScreen
    tolerance: 200
    toggleClass: false
    doIn: ->
      $(this).addClass 'onScreen'
      return

  $('section.career').onScreen
    tolerance: 200
    toggleClass: false
    doIn: ->
      $(this).addClass 'onScreen'
      return

  $('section.skills').onScreen
    tolerance: 200
    toggleClass: false
    doIn: ->
      $(this).addClass 'onScreen'
      return

  $('section.etc').onScreen
    tolerance: 200
    toggleClass: false
    doIn: ->
      $(this).addClass 'onScreen'
      return

  $('i.scrollHint').click (e) ->
    e.preventDefault()
    $('html,body').animate
      scrollTop: $('section.career').offset().top
    , 500
    return

  vAlignDesc()
  return

$(window).resize ->
  vAlignDesc()
  return

$(window).scroll ->
  pos = $(window).scrollTop()
  $('section.desc i.scrollHint').css 'opacity', 1 - (pos / 200)
  return


# チャート ツール
(($) ->
  $ ->
    $('#toolGraph').highcharts
      colors: [
        '#2467b1'
        '#573d7d'
        '#ffb756'
        '#f54d27'
        '#fba919'
        '#2c99c7'
        '#000'
      ]
      chart:
        plotBackgroundColor: null
        plotBorderWidth: null
        plotShadow: true

      title:
        text: 'tools'
        x: -20 #center

      tooltip:
        pointFormat: '{series.name}: <b>{point.percentage}%</b>'
        percentageDecimals: 1

      plotOptions:
        pie:
          allowPointSelect: true
          cursor: 'pointer'
          dataLabels:
            enabled: true
            color: '#666'
            connectorColor: '#666'
            formatter: ->
              '<b>' + @point.name + '</b>: ' + @percentage + ' %'

      series: [
        type: 'pie'
        name: 'Tools of work'
        data: [
          [
            'Photoshop'
            20.0
          ]
          [
            'Bootstrap'
            20.0
          ]
          [
            'Sublime Text'
            20.0
          ]
          [
            'Git'
            15.0
          ]
          [
            'Grunt'
            10.0
          ]
          [
            'Wordpress'
            10.0
          ]
          [
            'Yeoman'
            5.0
          ]
        ]
      ]

    return

  return
) jQuery

# チャート スキル
(($) ->
  $ ->
    $('#skillGraph').highcharts
      colors: [
        '#e44d26'
        '#0473b7'
        '#b7e39b'
        '#c6538c'
        '#ffda3e'
        '#5967a4'
        '#2c99c7'
      ]
      chart:
        plotBackgroundColor: null
        plotBorderWidth: null
        plotShadow: true

      title:
        text: 'skills'
        x: -20 #center

      tooltip:
        pointFormat: '{series.name}: <b>{point.percentage}%</b>'
        percentageDecimals: 1

      plotOptions:
        pie:
          allowPointSelect: true
          cursor: 'pointer'
          dataLabels:
            enabled: true
            color: '#666'
            connectorColor: '#666'
            formatter: ->
              '<b>' + @point.name + '</b>: ' + @percentage + ' %'

      series: [
        type: 'pie'
        name: 'Skill set'
        data: [
          [
            'HTML5'
            20.0
          ]
          [
            'CSS3'
            20.0
          ]
          [
            'Design'
            20.0
          ]
          [
            'Sass'
            17.0
          ]
          [
            'JavaScript'
            13.0
          ]
          [
            'PHP'
            5.0
          ]
          [
            'Wordpress'
            5.0
          ]
        ]
      ]

    return

  return
) jQuery

# 背景色
$ ->
  chengeBG = (secNum) ->
    unless secNum is current
      current = secNum
      $('body').stop().animate
        backgroundColor: bgColor[current]
      , 200
    return
  pageTop = $('html, body')
  secTopArr = Array()
  current = -1
  bgColor = new Array('#fff', '#f3f3f3', '#e0e0e0')
  $('section').each (i) ->
    secTopArr[i] = $(this).offset().top
    return

  $(window).scroll ->
    i = secTopArr.length - 1

    while i >= 0
      if $(window).scrollTop() > secTopArr[i] - 100
        chengeBG i
        break
      i--
    return

  return


# 閉じるボタン
$ ->
  $('.fa-times').hover (->
    $(this).stop().animate
      color: '#f56991'
    , 200
    return
  ), ->
    $(this).stop().animate
      color: '#333'
    , 700
    return

  return

# タイムラインのliにモーダルのトリガー用classと連番classとモーダル画面に連番id付与
timeline = document.querySelectorAll('ul.timeline li')
modal = document.querySelectorAll('.md-modal')
idNo = 0
i = 0

while i < timeline.length
  timeline[i].className = 'md-trigger'
  timeline[i].setAttribute 'data-modal', 'modal-' + (i + 1)
  modal[i].id = 'modal-' + (++idNo).toString()
  i++
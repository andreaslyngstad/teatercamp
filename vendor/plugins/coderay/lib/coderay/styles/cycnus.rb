module CodeRay
module Styles

  class Cycnus < Style

    register_for :cycnus

    code_background = '#f8f8f8'
    numbers_background = '#def'
    border_color = 'silver'
    normal_color = '#100'

    CSS_MAIN_STYLES = <<-MAIN
.CodeRay {
  background-color: #{code_background};
  border: 1px solid #{border_color};
  font-family: 'Courier New', 'Terminal', monospace;
  color: #{normal_color};
}
.CodeRay pre { margin: 0px }

div.CodeRay { }

span.CodeRay { white-space: pre; border: 0px; padding: 2px }

table.CodeRay { border-collapse: collapse; width: 100%; padding: 2px }
table.CodeRay td { padding: 2px 4px; vertical-align: top }

.CodeRay .line_numbers, .CodeRay .no {
  background-color: #{numbers_background};
  color: gray;
  text-align: right;
}
.CodeRay .line_numbers tt { font-weight: bold }
.CodeRay .no { padding: 0px 4px }
.CodeRay .code { width: 100% }

ol.CodeRay { font-size: 10pt }
ol.CodeRay li { white-space: pre }

.CodeRay .code pre { overflow: auto }
    MAIN

    TOKEN_COLORS = <<-'TOKENS'
.af { color:#00C }
.an { color:#007 }
.av { color:#700 }
.aw { color:#C00 }
.bi { color:#509; font-weight:bold }
.c  { color:#888 }

.ch { color:#04D }
.ch .k { color:#04D }
.ch .dl { color:#039 }

.cl { color:#B06; font-weight:bold }
.co { color:#036; font-weight:bold }
.cr { color:#0A0 }
.cv { color:#369 }
.df { color:#099; font-weight:bold }
.di { color:#088; font-weight:bold }
.dl { color:black }
.do { color:#970 }
.ds { color:#D42; font-weight:bold }
.e  { color:#666; font-weight:bold }
.en { color:#800; font-weight:bold }
.er { color:#F00; background-color:#FAA }
.ex { color:#F00; font-weight:bold }
.fl { color:#60E; font-weight:bold }
.fu { color:#06B; font-weight:bold }
.gv { color:#d70; font-weight:bold }
.hx { color:#058; font-weight:bold }
.i  { color:#00D; font-weight:bold }
.ic { color:#B44; font-weight:bold }

.il { background: #eee }
.il .il { background: #ddd }
.il .il .il { background: #ccc }
.il .dl { font-weight: bold ! important; color: #888 ! important }

.in { color:#B2B; font-weight:bold }
.iv { color:#33B }
.la { color:#970; font-weight:bold }
.lv { color:#963 }
.oc { color:#40E; font-weight:bold }
.on { color:#000; font-weight:bold }
.op { }
.pc { color:#038; font-weight:bold }
.pd { color:#369; font-weight:bold }
.pp { color:#579 }
.pt { color:#339; font-weight:bold }
.r  { color:#080; font-weight:bold }

.rx { background-color:#fff0ff }
.rx .k { color:#808 }
.rx .dl { color:#404 }
.rx .mod { color:#C2C }
.rx .fu  { color:#404; font-weight: bold }

.s  { background-color:#fff0f0 }
.s  .s { background-color:#ffe0e0 }
.s  .s  .s { background-color:#ffd0d0 }
.s  .k { color:#D20 }
.s  .dl { color:#710 }

.sh { background-color:#f0fff0 }
.sh .k { color:#2B2 }
.sh .dl { color:#161 }

.sy { color:#A60 }
.sy .k { color:#A60 }
.sy .dl { color:#630 }

.ta { color:#070 }
.tf { color:#070; font-weight:bold }
.ts { color:#D70; font-weight:bold }
.ty { color:#339; font-weight:bold }
.v  { color:#036 }
.xt { color:#444 }
    TOKENS

  end

end
end

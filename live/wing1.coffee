#!/usr/bin/env coffee

program = require 'commander'

#
# Wing Commander games list
#
wingCommanders = [
   {
      dos: true,
      opus: 'I',
      consoles: ['amiga', 'megacd'],
      year: 1990,
      name: 'Wing Commander'
   }, {
      dos: true,
      opus: 'II',
      consoles: [],
      year: 1992,
      name: 'Wing Commander II'
   }, {
      dos: true,
      opus: 'III',
      consoles: [],
      year: 1993,
      name: 'Wing Commander III'
   }
]

consoles = (list) ->
   list.split ','

program
   .version('1.0')
   .option('-o, --opus-number [number]', 'Wich opus')
   .option('-y, --year [year]', 'Wich year', Number)
   .option('-d, --dos', 'Run on MSDOS')
   .option('-c, --console [console]', 'On wich consoles')
   .parse(process.argv)

console.log 'Your game :'
if program.dos then console.log '- Run on MSDOS'
console.log "- Is of #{program.year}"
console.log "- Is the opus #{program.opusNumber}"
console.log "- Can be found for #{program.console}"

for wc in wingCommanders
   do (wc) ->
      if program.dos is wc.dos and
            program.year is wc.year and
            program.opus is wc.opusNumber and 
            program.console in wc.consoles
         console.log "Its #{wc.name}"   



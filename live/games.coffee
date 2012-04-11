#!/usr/bin/env coffee

program = require 'commander'

#
# Wing Commander games list
#
games = [
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


program
   .command('search')
   .description('search games by arguments')
   .action () ->
      console.log 'Your game :'
      if program.dos then console.log '- Run on MSDOS'
      console.log "- Is of #{program.year}"
      console.log "- Is the opus #{program.opusNumber}"
      console.log "- Can be found for #{program.console}"

      for game in games
         do (game) ->
            if program.dos is game.dos and
                  program.year is game.year and
                  program.opus is game.opusNumber and 
                  program.console in game.consoles
               console.log "Its #{game.name} !"   

program
   .command('list [console]')
   .description('list all games filter by console')
   .action (cons) ->
      for game in games
         do (game) ->
            if not cons? or cons in game.consoles
               console.log "- #{game.name}"

program.parse(process.argv)

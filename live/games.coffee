#!/usr/bin/env coffee

#
# Requirement
#
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

#
# Declaration of all the options
#
program
   .version('1.0')
   .option('-o, --opus-number [number]', 'Wich opus')
   .option('-y, --year [year]', 'Which year', Number)
   #Type coersion can be a function
   #A last argument can be the default value
   .option('-d, --dos', 'Run on MSDOS')
   .option('-c, --console [console]', 'On which consoles')

program.on '--help', () ->
   console.log '  Pour la démo:'
   console.log ''
   console.log '  ./games.coffee --help'
   console.log '  ./games.coffee list'
   console.log '  ./games.coffee list amiga'
   console.log '  ./games.coffee search -o I --year 1990 -dc amiga'
   console.log '  ./games.coffee choose'

#
# A simple command
#
program
   .command('list [console]')
   .description('list all games filter by console')
   .action (cons) ->
      for game in games
         do (game) ->
            if not cons? or cons in game.consoles
               console.log "- #{game.name}"

#
# Argument analysis
#
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

#
# Prompt sample
#
program
   .command('choose')
   .description('Choose your favorite game')
   .action () ->
      console.log 'Choose your favorite game:'
      gamesName = (game.name for game in games)

      program.choose gamesName, (i) ->
         console.log "Hey, my favorite is #{games[i].name} too !"
         process.exit 0

#
# Parsing needed
#
program.parse(process.argv)

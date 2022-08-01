/**
 - Create By Oscar-Md
 - Contact Me on https://wa.me/+6285850539404
 - Follow iG : @Oscar_bot
*/

const fs = require("fs")
const chalk = require("chalk")

// Other
global.thum = fs.readFileSync("./worker/media/image/thumb.jpg")
global.log0 = fs.readFileSync("./worker/media/image/thumb.jpg")
global.err4r = fs.readFileSync("./worker/media/image/thumb.jpg")
global.owner = ['919961857267','919961857267','919961857267']
global.rkyt = []
global.banUser = ['6281366679021@s.whatsapp.net']
global.ntilink = ['120363043965529911@g.us','120363022988111568@g.us']
global.wlcm = ['120363043965529911@g.us','120363023112413670@g.us','19054091487-1424650263@g.us','120363022988111568@g.us']
global.gcrevoke = ['19054091487-1424650263@g.us']
global.packname = "59X8C K8CH7<💌"
global.packname2 = "BY K8CH7<👀"
global.author = "TOXIC KICHU 💌"
global.sessionName = "session"
global.linkgrupss = "https://toxic-kichu.github.io"
global.antitags = true
global.prefa = ['','!','.','🐦','🐤','🗿']
global.mess = {
    success: 'Success',
    admin: 'Emang lu Admin Group!',
    botAdmin: 'Bot bukan admin dek:v',
    owner: 'Emang lu Owner Bot',
    group: 'Fitur Digunakan Hanya Untuk Group!',
    private: 'Fitur Digunakan Hanya Untuk Private Chat!',
    bot: 'Fitur Khusus Pengguna Nomor Bot',
    wait: 'Loading...',
    linkm: 'Linknya Mana Kak?',
    ban: 'Kamu telah dibanned oleh owner, Jika ingin di unbanned chat owner'
}
global.limitawal = {
    rakyat: "Infinity",
    free: 100
}

let file = require.resolve(__filename)
fs.watchFile(file, () => {
	fs.unwatchFile(file)
	console.log(chalk.redBright(`Update'${__filename}'`))
	delete require.cache[file]
	require(file)
})

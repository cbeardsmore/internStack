const functions = require('firebase-functions');

const nodemailer = require('nodemailer');
const gmailEmail = functions.config().gmail.email;
const gmailPassword = functions.config().gmail.password;
const mailTransport = nodemailer.createTransport({
	service: 'gmail',
	auth: {
		user: gmailEmail,
		pass: gmailPassword,
	},
});

exports.submissionEmail = functions.firestore.document('/submissions/{documentId}').onCreate((snapshot, context) => {
	const data = snapshot.data();
	console.log('New submission:', data);

	const dataAsText = 
		"Name: " + data.name + "\n" + 
		"Email: " + data.email + "\n" + 
		"Company: " + data.company + "\n" +
		"Other Info: " + data.other + "\n";

	const mailOptions = {
		from: '"internStack Cloud Functions" <internstack@gmail.com>',
		subject: 'New internStack Submission -> ' + data.company,
		text: dataAsText
	};

	let mailOptionsConnor = Object.assign({}, mailOptions);
	mailOptionsConnor.to = functions.config().gmail.connor;
	let mailOptionsSammi = Object.assign({}, mailOptions);
	mailOptionsSammi.to = functions.config().gmail.sammi;

	mailTransport.sendMail(mailOptionsConnor)
		.then(() => console.log(`New submission email sent to Connor`))
		.catch((error) => console.error('Error sending new submission email:', error));

	mailTransport.sendMail(mailOptionsSammi)
		.then(() => console.log(`New submission email sent to Sammi`))
		.catch((error) => console.error('Error sending new submission email:', error));

	return data;
});



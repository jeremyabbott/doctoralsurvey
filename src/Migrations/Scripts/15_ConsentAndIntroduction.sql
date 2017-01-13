ALTER TABLE dbo.Surveys ADD	CoverLetter VARCHAR (3000) NULL;
ALTER TABLE dbo.Surveys ADD ConsentLetter VARCHAR(3000) NULL;
ALTER TABLE dbo.Surveys ADD CoverLetterVideoUrl VARCHAR(255) NULL;
ALTER TABLE dbo.Surveys ADD ConsentVideoUrl VARCHAR(255) NULL;

GO;

DECLARE @surveyId INT,
        @coverLetter VARCHAR(3000) =
'<p>January 13, 2017</p>
<p>Dear Potential Participant,</p>
<p>I am a doctoral student in the Education Department at Louisiana State University in Shreveport, Louisiana and I am conducting a study of Deaf identity and its effect on the leader-follower relationship.  The objective of this research project is to attempt to understand if a person’s Deaf identity plays a role in the leader-follower relationship involving people who are Deaf or hard of hearing.</p>
<p>The questionnaire is internet based and follows this letter.  The brief questionnaire asks a variety of questions about your attitudes toward your current job, Deaf people, hearing people, sign language, and discrimination.  I am asking you to look over the questionnaire and, if you choose to do so, complete the questionnaire and click on the “submit” button.  This will send the questionnaire results to my secure email.</p>
<p>If you choose to participate, you will have the option to include your name.  I do not need to know who you are and no one else will know whether you participated in this study.  Your responses will not be identified with you personally, nor will anyone be able to determine which company you work for.  Nothing you say on the questionnaire will in any way influence your present or future employment with your company.</p> 
<p>I hope you will take a few minutes to complete this questionnaire.  Without the help of people like you, research on Deaf identity and the leader-follower relationship could not be conducted.  Your participation is voluntary and there is no penalty if you do not participate.  You may withdraw at any time!</p>
<p>If you have any questions or concerns about completing the questionnaire or about participating in this study, you may contact me at (318) 344-5130 or at hyland13@lsus.edu.  If you have any questions about your rights as a research subject, you may contact the Louisiana State University Shreveport Institutional Review Board (IRB) by mail at One University Place, Shreveport, Louisiana, 71115, by phone at (318) 797-5000, or by e-mail at sanjay.menon@lsus.edu. This study was approved by the IRB on June 22, 2016.</p>

<p>Sincerely,</p>

<p><strong>David W. Hylan, Jr</strong></p>

<p>Davis W. Hylan, Jr., MS.<br />
Doctoral Student<br />
Department of Education and Business<br />
Louisiana State University – Shreveport</p>',
        @consentLetter VARCHAR(3000) =
'<h3><strong>Study of Leader-Member Exchange and the Effect of Deaf Identity on Relationship Quality</strong></h3>
<p>January 13, 2017</p>
<p>You are being invited to participate in a research study about Deaf identity and its effect on leadership preference in the Deaf Community.  The objective of this research project is to attempt to understand if a person’s Deaf identity plays a role in the leader-follower relationship involving people who are Deaf or hard of hearing.   It is being conducted across the United States via the internet.</p>
<p>There are no known risks if you decide to participate in this research study, nor are there any costs for participating in the study.  The information you provide will help me understand how best to address employer and Deaf employee relationships, as well as, how to satisfy the needs of companies and the needs of Deaf employees. The information collected may not benefit you directly, but what I learn from this study should provide general benefits to employees, companies, and researchers.</p>
<p>This survey is anonymous. If you choose to participate, you do not have to provide your name.  No one will be able to identify you, nor will anyone be able to determine which company you work for.  No one will know whether you participated in this study.  Nothing you say on the questionnaire will in any way influence your present or future employment with your company.</p>
<p>Your participation in this study is voluntary and you may withdraw at any time without any penalty.  If you choose to participate, please complete the following questionnaire and click the “submit” button.  If you prefer, you may print and mail the survey to: David W. Hylan, Jr., MS, 906 Kirby Pl, Shreveport, LA 71104 or send by email to hyland13@lsus.edu.</p>
<p>If you have any questions or concerns about completing the questionnaire or about being in this study, you may contact me at (318) 344-5130 or at hyland13@lsus.edu</p>
<p>The Louisiana State University Shreveport Institutional Review Board has reviewed my request to conduct this project.  If you have any concerns about your rights in this study, please contact Dr. Sanjay Menon of the LSUS-IRB at 318-797-5000 or email sanjay.menon@lsus.edu.</p>
<p>Clicking the “Next” button below indicates that you are 18 years of age or older, and indicates your consent to participate in this survey.</p>';

SELECT @surveyId = s.Id
FROM dbo.Surveys s
WHERE s.Name = 'DEAF';

UPDATE dbo.Surveys
SET CoverLetter = @coverLetter,
    ConsentLetter = @consentLetter,
    CoverLetterVideoUrl = 'http://www.youtube.com/embed/eXNcfIzuWGo',
    ConsentVideoUrl = 'http://www.youtube.com/embed/2vXe6E0HtZE'
WHERE Id = @surveyId;

SELECT @surveyId = s.Id
FROM dbo.Surveys s
WHERE s.Name = 'HEARING';

UPDATE dbo.Surveys
SET CoverLetter = @coverLetter,
    ConsentLetter = @consentLetter
WHERE Id = @surveyId;

select * from Surveys
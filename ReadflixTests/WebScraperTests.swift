//
//  WebScraperTests.swift
//  ReadflixTests
//
//  Created by Zhenglong Wu on 05/11/2021.
//

import XCTest
@testable import Readflix

class WebScraperTests: XCTestCase {

    func testGetParsedTextReturnsStringOfParsedText() {
        
        let webScraper = WebScraper()
        
        let testData = [(data: "https://www.apple.com/uk/iphone-13-pro/", expected: "Let’s Pro. * View in AR Super Retina XDR display1 with ProMotion iPhone 13 Pro Max 6.7” iPhone 13 Pro 6.1” iPhone 13 Pro in Graphite, Gold, Silver and Sierra Blue Sierra Blue, Silver, Gold and Graphite Surgical-grade stainless steel Ceramic Shield, tougher than any smartphone glass Industry-leading IP68 water resistance2 Our Pro camera system gets its biggest upgrade ever. With next-level hardware that captures so much more detail. Super-intelligent software for new photo and filmmaking techniques. And a mind-blowingly fast chip that makes it all possible. It’ll change the way you shoot. Whoa. With its redesigned lens and powerful autofocus system, the new Ultra Wide camera can focus at just 2cm — making even the smallest details seem epic. Transform a leaf into abstract art. Capture a caterpillar’s fuzz. Magnify a dewdrop. The beauty of tiny awaits. Macro stills are just the beginning. You can also shoot macro videos — including slow motion and time-lapse. Prepare to be mesmerised. Bring on the night. iPhone 13 Pro was made for low light. The Wide camera adds a wider aperture and our largest sensor yet — and it leverages the LiDAR scanner for Night mode portraits. Ultra Wide gets a wider aperture, a faster sensor and all-new autofocus. And Telephoto now has Night mode. The Wide camera captures up to 2.2x more light for better photos and videos The Ultra Wide camera captures 92% more light for better photos and videos Night mode now on every camera Sharper, more detailed photos and videos in any light More zoom? Boom. The new Telephoto camera features a 77mm focal length and 3x optical zoom — great for classic portraiture or shooting clearer photos and videos from far away. For closer subjects, try Portrait mode, where you can dial in the bokeh and experiment with studio-quality lighting effects. Shift the focus. Up the drama. Presenting Cinematic mode. Now iPhone can shoot with shallow depth of field and automatically add elegant focus transitions between subjects. Cinematic mode can also anticipate when a prominent new subject is about to enter the frame and bring them into focus when they do, for far more creative storytelling. You have the option to change focus or adjust the level of bokeh even after capture. We can’t wait to see what you do with it. To bring Cinematic mode to iPhone, we carefully studied how master filmmakers use rack focus to add drama and emotion to the story. On Hollywood shoots, pulling focus requires a talented team of experts. Like a cinematographer, who makes the overall call about what’s in focus and when that changes. And a focus puller, who makes sure the transition is smooth, the timing is spot on and the subjects are perfectly crisp. Making all this happen automatically on your iPhone was no small feat. First we had to generate high-quality depth data so Cinematic mode knows the precise distance to the people, places and pets in a scene. And because this is video, we needed that depth data continuously — at 30 frames per second. We also trained the Neural Engine to work like the experts. It makes on-the-fly decisions about what should be in focus, and it applies smooth focus transitions when that changes. If you want creative control, you can always hop in the director’s chair and rack focus manually, either when you shoot or in the edit. It’s so computationally intense, we needed a chip that could handle the workload. Enter A15 Bionic. The sheer computational power needed to run the machine learning algorithms, render autofocus changes, support manual focus changes and grade each frame in Dolby Vision — all in real time — is astounding. It’s like having Hollywood in your pocket. Customise your camera to lock in your look. Introducing Photo­graphic Styles. Photographic Styles apply your preferred Tone and Warmth settings to your photos. But unlike filters, they keep things like skies and skin tones natural. Choose an Apple-designed preset — Vibrant, Rich Contrast, Warm or Cool — and if you want, fine-tune it even further. Set your style once to get the look you love every time. Shoot it.Cut it.Ship it. All in ProRes. The high colour fidelity and low compression of ProRes let you record, edit and deliver broadcast-ready content on the go. Now you can complete a project in ProRes entirely on your iPhone. Or easily bring ProRes videos from your iPhone into Final Cut Pro on your Mac. Harnessing the machine learning power of the Neural Engine, Smart HDR 4 now makes unique adjustments for multiple people in a scene. Our software and ISP automatically refine contrast, lighting and skin tones for each person. So everyone always looks amazing. For mid- to low-light shots, Deep Fusion kicks in — using the Neural Engine to perform a pixel-by-pixel analysis of various exposures and fusing the best parts into your final image. It delivers extraordinary detail, bringing out even the subtlest textures in your photos. Telephoto Ultra Wide Wide Our three most powerful cameras ever The TrueDepth camera system is a total Pro too, with: No wonder your selfies look so good. Up to of storage, plenty for all those photos and videos Up to 1TB of storage, plenty for all those photos and videos Hello, ProMotion. Meet the 120Hz adaptive refresh display that changes the game. The new Super Retina XDR display with ProMotion can refresh from 10 to 120 times per second, and all kinds of frame rates in between. It intelligently ramps up when you need exceptional graphics performance, and ramps down to save power when you don’t. It even accelerates and decelerates naturally to match the speed of your finger as you scroll. You’ve never felt anything like it. Up your game. The display’s ability to refresh up to 120Hz — combined with the amazing graphics performance of the new 5-core GPU on A15 Bionic — makes iPhone 13 Pro perfect for power gamers. Running a display that refreshes 120 times every single second requires a ton of power. But you don’t really need all that speed all the time. One way to be more efficient is to set standard frame rates for different types of content. Say, 10 fps for a book and 120 fps for a game. The problem with this approach is that frame rates are always changing. If the game drops to 30 fps for a menu screen while the display is set at 120 fps, you end up using precious battery life without seeing any benefit from the higher frame rate. For us, power is far too important to waste on empty frames. So we set out to design a more intelligent solution. One that can adapt to ever-changing refresh rates. With ProMotion, there are no settings. Refresh rates are tied to whatever’s happening on the screen. If your game drops to 30 fps, ProMotion dips to 30 fps too. If you’re watching a video that was filmed at 24 fps, it plays at 24 fps. All of this saves power. ProMotion makes it feel like you’re reaching right through the screen and touching the code. We also considered the way your finger speeds up and slows down as you scroll, swipe or pinch. The speed of your finger now drives the speed of each gesture. iOS 15 is full of moments where 120Hz makes the interface feel glued to your finger. It’s just so fast. But even then, ProMotion only uses 120Hz at the precise moment you’ll feel the impact. It would have been much easier to put a 120Hz iPhone in your hand without worrying about battery life. But that’s not the Apple way. We wanted to deliver fast frame rates when you need them, and preserve battery life when you don’t. Pure. Pro. Power. A15 Bionic is the world’s fastest smartphone chip. Year after year, iPhone silicon pushes our idea of what’s possible with smartphones. A big reason why is that we build long-term product road maps — and bring our teams together — in ways no other company can. Deep integration between our teams allows us to deliver features you can’t find on any other smartphone. That’s how we deliver features like ProMotion, which have to be planned years in advance. Our chip team fully understood the needs of the display hardware, display software and operating system teams, and took them into account for A15 Bionic. For example, we overhauled the display engine to support variable frame rates, then designed the system so ProMotion could capture the incredible graphics performance — and efficiency potential — of the new 5-core GPU. In turn, the display software and iOS teams decided where all that speed would make the biggest impact, and where they could optimise refresh rates to use a lot less power. What’s truly unique about Apple is that we don’t just start with a superfast chip and build features around it. Instead, we start with an idea about a great experience we’d like you to have, and then we all work together to bring it to life. iPhone 13 Pro Max has the best battery life ever on iPhone. Add a MagSafe charger for faster wireless charging. No one does 5G like iPhone. The world is quickly moving to 5G. Streaming, downloading — everything happens so much faster. 5G is even fast enough for serious multiplayer gaming, sharing AR videos and more. With Smart Data mode, iPhone will switch down a gear automatically to save power when you don’t need all that speed.4 In touch. In the moment. iOS 15 lets you keep the conversation going while sharing movies, music or whatever’s on your screen in FaceTime. Stay in the zone by filtering out any notifications that aren’t relevant to the task at hand. And interact with text in images to quickly send email, make calls, get directions and more. Learn more about iOS 15 Privacy is built in. iPhone helps put you in control of your personal information. For example, Privacy Nutrition Labels help you see how apps use your data. Apps need your permission to track your activity across other companies’ apps or websites. And that’s just for starters. Our stores, offices, data centres and operations are already carbon neutral. By 2030 our products — and your carbon footprint from using them — will be too. This year we eliminated the plastic wrapping around the iPhone 13 and iPhone 13 Pro boxes, saving 600 tonnes of plastic. And our established final assembly sites now send zero waste to landfill. Stream songs, albums and curated playlists. Catch the shows everyone is raving about. Discover exciting new games. Keep up on the news and stories you love. Find your next favourite workout. Apple services put so much at your fingertips, and Apple One bundles them all into a simple subscription. Everything you love about your iPhone gets even better when you use it with a Mac, iPad or Apple Watch. It all just works together — seamlessly. Answer a call on whatever is close at hand. Take a photo on your iPhone and watch it instantly appear on your Mac. And see all your texts, all the time, on all your devices. Easy. Check it out. See it from every angle and in every colour. View iPhone 13 Pro in AR View iPhone 13 Pro Max in AR See iPhone 13 Pro and 13 Pro Max in AR. Open this page in Safari on your iPhone or iPad. Deck it out. Take the perfect iPhone accessory and make it yours with free engraving — only from Apple. Attach one to your keys. Slip another in your backpack. Then easily keep track of them in the Find My app. Snap on a magnetic case, wallet, or both. And get faster wireless charging. Shop all iPhone accessories With Apple Trade In, you can get credit towards a new iPhone when you trade in an eligible smartphone.5 It’s good for you and the planet. Learn more You won’t find a better place to buy iPhone. We know about network providers, payment options and more. And we make it easy to understand. Learn more Choose two-hour courier or free, next-day delivery. Monthly payment options available. Have a question? Call a Specialist or chat online. Call 0800 048 0408. From basics to pro tips, get more out of your new iPhone."), (data: "https://www.apple.com/uk/macbook-pro-14-and-16/", expected: "The most powerful MacBook Pro ever is here. With the blazing-fast M1 Pro or M1 Max chip — the first Apple silicon designed for pros — you get groundbreaking performance and amazing battery life. Add to that a stunning Liquid Retina XDR display, the best camera and audio ever in a Mac notebook, and all the ports you need. The first notebook of its kind, this MacBook Pro is a beast.  Up to 3.7x faster CPU performance1 Up to 13x faster graphics performance2 Up to 11x faster machine learning3 Up to 21 hours battery life4 Up to 10-core CPU Up to 16-core GPU Up to 32GB of unified memory Up to 200GB/s memory bandwidth 10-core CPU Up to 32‑core GPU Up to 64GB of unified memory Up to 400GB/s memory bandwidth M1 Pro and M1 Max scale the amazing M1 architecture to new heights — and for the first time, they bring a system on a chip (SoC) architecture to a pro notebook. Both have more CPU cores, more GPU cores and more unified memory than M1. Along with a powerful Neural Engine for supercharged machine learning and upgraded media engines with ProRes support, M1 Pro and M1 Max allow pros to do things they never could before. M1 Pro takes the exceptional performance of the M1 architecture to a whole new level for pro users. Even the most ambitious projects are easily handled with up to 10 CPU cores, up to 16 GPU cores, a 16‑core Neural Engine, and dedicated encode and decode media engines that support H.264, HEVC and ProRes codecs. Up to 16‑core GPU Up to 32GB of unified memory Up to 200GB/s memory bandwidth Support for two external displays Up to 20 streams of 4K ProRes video playback5 M1 Max is the most powerful chip ever created for a pro notebook, with 10 CPU cores, up to 32 GPU cores and a 16-core Neural Engine. It delivers two times faster graphics processing and double the memory bandwidth of M1 Pro. And it has a dedicated media engine for decode and two for encode — with up to two times faster video encoding — and two ProRes accelerators for even higher multi-stream performance. Up to 32‑core GPU Up to 64GB of unified memory Up to 400GB/s memory bandwidth Support for four external displays Up to 7 streams of 8K ProRes video playback6 The new MacBook Pro is available in 14‑ and 16‑inch models. Each can be configured with the M1 Pro or M1 Max chip and offers unprecedent­ed levels of pro performance. So you can manipulate millions of polygons in Cinema 4D, edit up to seven streams of 8K ProRes video in Final Cut Pro, or grade colour in HDR on 8K 4444 ProRes video — all miles away from the edit bay. Ferocious performance with game‑changing battery life — that efficiency is the magic of Apple silicon. A single charge lets you compile up to four times as much code in Xcode19 or edit images for up to twice as long in Lightroom Classic.20 And unlike other notebooks, MacBook Pro delivers the same amazing performance whether it’s plugged in or not. The coolest part. Advanced thermal systems move 50 per cent more air, even at lower fan speeds. And thanks to the efficiency of Apple silicon, the fans never turn on for many tasks you do every day. Fast. And vast. Get jaw-dropping 7.4GB/s read speeds23 from the up to 8TB SSD — up to two times faster than the previous generation.24 So you can open 8K videos instantly or store hundreds of thousands of RAW photos at once. The new MacBook Pro is the first to put a system on a chip (SoC) into a pro notebook. Other pro systems use power-hungry CPUs, discrete GPUs and multiple chips, each working separately. M1 Pro and M1 Max combine the CPU, GPU, I/O and Neural Engine in a single SoC with unified memory. As a result, M1 Pro and M1 Max not only crush intensive workflows that were once impossible on a notebook — they also provide incredible battery life. Connected at the chip. Other pro notebooks need to copy data back and forth over a slower interface. Not the new MacBook Pro. Its CPU and GPU share a single pool of unified memory. That means every part of the chip connects to data and memory without needing to copy it, so everything you do is faster and more efficient. M1 Pro and M1 Max CPUs each leverage up to eight high-performance cores and two high-efficiency cores to deliver faster processing at a tenth of the power. Their GPUs have access to lower-latency data with vastly improved power efficiency for unmatched performance per watt. At their peak, M1 Pro and M1 Max deliver 1.7 times more performance than the latest 8-core PC laptop chip in the same power envelope. And they match the highest performance levels of the PC chip at 70 per cent less power.25 M1 Pro consumes 70 per cent less power at its peak than a PC laptop with a discrete GPU.26 At its peak, M1 Max delivers more performance — and consumes 40 per cent less power — than a compact pro laptop with a high-performing discrete GPU. And compared with a high-end laptop with discrete graphics, M1 Max delivers similar performance while using 100 watts less power.26 Liquid Retina XDR. The best display ever in a notebook features Extreme Dynamic Range and a 1,000,000:1 contrast ratio. HDR content comes to life in photos, video and games — with refined specular highlights, incredible detail in shadows, and vibrant, true-to-life colours. Each display is factory calibrated and features pro reference modes for HDR colour grading, photography, design and print production. ProMotion. ProMotion comes to Mac for the first time, making everything from scrolling through a web page to gaming super-fluid and responsive — while also reducing power consumption. With refresh rates of up to 120Hz, the adaptive technology automatically adjusts to match the movement of the content. ProMotion video editors can also choose a fixed refresh rate that precisely aligns with their footage. Display enclosure. Less than 4mm thin, it provides the structure for the world’s best notebook display. Mini-LEDs. Thousands of mini-LEDs are grouped into individually controlled local dimming zones for precise brightness and contrast. Custom optical films and diffusers. Seven films and diffusers mix and shape the light efficiently while enabling an ultra-thin design. High mobility oxide TFT. The oxide thin film transistor (TFT) allows pixels to charge two times faster than before, enabling refresh rates of up to 120Hz. LCD panel. The active area of the display is pushed to the edge for up to 60 per cent thinner borders, providing more room for your content. 1,000nits sustained brightness 1,600nits peak brightness 10,000 mini-LEDs27 1,000,000:1contrast ratio 1,000,000,000 colours 16.2″ 3456x2234 7.7 million pixels 254 ppi 14.2″ 3024x1964 5.9 million pixels 254 ppi Staying connected is more important than ever. That’s why the new MacBook Pro camera has double the resolution — 1080p — and uses a lens with a wider aperture that lets in more light. Together with a larger image sensor that has more efficient pixels, the camera delivers two times better low‑light performance. Three studio‑quality mics. Thanks to mics with an up to 60 per cent lower noise floor, MacBook Pro can capture even the subtlest sounds. And the three-mic array uses directional beamforming so your voice always comes through loud and clear. Six-speaker sound system. Four force-cancelling woofers reveal notes up to a half-octave deeper and fill the room with up to 80 per cent more bass. And the high‑performance tweeters project clearer, fuller vocals. Spatial audio. Thanks to the room‑filling six‑speaker system and advanced algorithms, MacBook Pro supports spatial audio when playing music or video with Dolby Atmos, creating a sophisticated three‑dimensional soundstage. Combine that with the Liquid Retina XDR display, and it’s like having a portable cinema. Transfer photos and videos with an SDXC card reader. Connect to TVs or displays with HDMI output. Listen using a 3.5mm headphone jack that detects and automatically adjusts for high‑impedance headphones. Connect to high-speed peripherals or displays with three Thunderbolt 4 ports. And fast‑charge using the quick‑releasing MagSafe 3 port. For the first time, Magic Keyboard brings a full‑height function key row to MacBook Pro — with the tactile feel of mechanical keys that pros love. It includes new keyboard shortcuts for Spotlight, Dictation and Do Not Disturb. And Touch ID has a new, tactile ring that guides your finger for a fast, easy, secure way to unlock your Mac. Use a single keyboard and mouse or trackpad to work seamlessly between your Mac and iPad with Universal Control.28 Automate complex tasks with Shortcuts. Share your screen, watch together or collaborate with FaceTime. And browse with the best Safari yet. When it’s time to concentrate, Focus lets you control which people and apps can reach you. Learn more about macOS Monterey Over 10,000 apps and plug-ins are already optimised for Apple silicon. And Rosetta 2 seamlessly translates apps designed for Intel processors for use on your new MacBook Pro. Adobe Photoshop, Affinity Photo, Capture One, Adobe Photoshop Lightroom Classic and more. Affinity Designer, Sketch, Vectorworks, Adobe Illustrator, Pixelmator Pro and more. Octane X,29 Maxon Cinema 4D, Redshift, Blender and more. Logic Pro, Ableton Live 11, Adobe Audition, FL Studio and more. Adobe Premiere Pro, Blackmagic Design DaVinci Resolve, Final Cut Pro, Motion, Compressor, Adobe Media Encoder, Blackmagic Fusion Studio, Adobe After Effects30 and more. Xcode, Unity Editor,30 Create ML, TensorFlow, Visual Studio Code, NAG Fortran Compiler and more. NASA TetrUSS, Wolfram Mathematica, OsiriX MD, Shapr3D, CrystalMaker® and more. Open this page using Safari on your iPhone or iPad. The new MacBook Pro has been carefully designed with the environment in mind. The enclosure is now made with 100% recycled aluminium. And we use recycled rare earth elements in all the magnets in the product. MacBook Pro is free of numerous harmful substances and all the virgin wood fibre in our packaging comes from responsibly managed forests. Learn more about Apple and the environment Just trade in your eligible computer for credit or recycle it for free. It’s good for you and the planet.* Find your trade-in value Shop Compare all Mac models Learn about Apple at Work See why Mac means business Learn about Apple and Education Monthly payment options available. And free returns. See checkout for delivery dates. Have a question? Call a Specialist or chat online. Call 0800 048 0408. From basics to pro tips, get more out of your new Mac.")]
                         
        for test in testData {
            let result = webScraper.getParsedText(inputUrl: test.data)
            XCTAssertEqual(result, test.expected)
        }
        
    }

}

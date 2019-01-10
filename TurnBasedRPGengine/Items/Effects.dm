obj
	FX
		ITEM_POPUP
			layer=MOB_LAYER+10
			pixel_x=42
			New(Party_Members/user,ITEMS/clone)
				..()
				animate(src, transform = null, alpha = 0, time = 1)
				spawn(1)
					animate(src, transform = null, pixel_y=42, alpha = 255, time = 8)
					src.loc=user.loc
					icon='Items/teenies.dmi'
					icon_state="[clone.icon_state]"
					spawn(8)
						animate(src, transform = matrix()*2, alpha = 0, time = 6)
						spawn(10)
							del(src)
		PokeBallFX
			density=1
			icon='Items/32x.dmi'
			poke
				icon_state="pokeball"
			master
				icon_state="masterball"
			New(ENEMY/target, Party_Members/user)

				src.loc=user.loc
				walk_towards(src,target,0,15)
				..()
			Bump(ENEMY)
				walk(src,0)
				pixel_x-=1
				pixel_y+=1
				spawn(0.5)
					pixel_x-=1
					pixel_y+=1
					spawn(0.5)
						pixel_x-=1
						pixel_y+=1
						spawn(0.5)
							pixel_x-=1
							pixel_y+=1
							spawn(1)
								pixel_y-=1
								spawn(0.5)
									pixel_y-=2
									spawn(0.5)
										pixel_y-=1
										spawn(0.5)
											pixel_y+=1
											spawn(0.5)
												pixel_y-=1
												spawn(15)
													del(src)
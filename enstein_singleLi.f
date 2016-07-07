      implicit none
      integer natoms,nsteps,ntype,numb(106),check,nt
      real avol,ex,ey,ez,dt,realtime
      real temp
      character*1 trash
      real angst,femto
      integer i,j,jstart,time,nav,switch
      real dx,dy,dz
      real xn(1000),yn(1000),zn(1000),xo(1000),yo(1000),zo(1000)
      real disp(106),dxs,dys,dzs,dr2
      real x(100000,1000),y(100000,1000),z(100000,1000),var
      angst=1.0E-10
      femto=1.0E-15
      read(*,*) switch,ntype,(numb(nt),nt=1,ntype),dt
      read(*,*)
      read(*,*)

      natoms=0
      do nt=1,ntype
         disp(nt)=0
         natoms=natoms+numb(nt)
      enddo
      read(*,*) ex,var,var
      read(*,*) var,ey,var
      read(*,*) var,var,ez
c      ex=ex/angst                                                                                  
c      ey=ey/angst                                                                                  
c      ez=ez/angst                                                                                  
c      write(*,*) ex,ey,ez                                                                          
c      read(*,*) temp                                                                               
      read(*,*)
      read(*,*)
      dx=0
      dy=0
      dz=0
      do i=1,100000
c         read(*,*,end=1)                                                                           
         nsteps=i
         do j=1,natoms
            read(*,*,end=1) xn(j),yn(j),zn(j)
            if(i.eq.1) then
               xo(j)=xn(j)
               yo(j)=yn(j)
               zo(j)=zn(j)
               x(i,j)=xo(j)*ex
               y(i,j)=yo(j)*ey
               z(i,j)=zo(j)*ez
            elseif(i.gt.1) then
               dx=xn(j)-xo(j)
               dy=yn(j)-yo(j)
               dz=zn(j)-zo(j)
               if(dx.gt.0.5) dx=dx-1.0
               if(dy.gt.0.5) dy=dy-1.0
               if(dz.gt.0.5) dz=dz-1.0
               if(dx.lt.-0.5) dx=dx+1.0
               if(dy.lt.-0.5) dy=dy+1.0
               if(dz.lt.-0.5) dz=dz+1.0
               x(i,j)=x(i-1,j)+dx*ex
               y(i,j)=y(i-1,j)+dy*ey
               z(i,j)=z(i-1,j)+dz*ez
               xo(j)=xn(j)
               yo(j)=yn(j)
               zo(j)=zn(j)
            endif
         enddo
      enddo
 1    continue
      if(nsteps.gt.100000) then
         write(*,*) 'Error: too many time steps ',nsteps,' > 10000'
         stop
         endif
c      write(*,*) xo(1),yo(1),zo(1)                                                                 
c      write(*,*) x(nsteps,1),y(nsteps,1),z(nsteps,1)                                               
c      write(*,*) (x(nsteps,natoms)-x(1,natoms))/ex                                                 
c      write(*,*) (y(nsteps,natoms)-y(1,natoms))/ey                                                 
c      write(*,*) (z(nsteps,natoms)-z(1,natoms))/ez                                                 
      write(*,900) 0.0,(disp(nt),nt=1,ntype)
      do time=1,nsteps-1
         realtime=float(time)*dt/femto
         nav=nsteps-time
         jstart=1
c         write(*,*) 'starting time ',time,nav
         do nt=1,ntype
c            write(*,*) 'starting type ',nt,numb(nt)                                                
            dxs=0
            dys=0
            dzs=0
            do i=1,nav
               do j=jstart,jstart+numb(nt)-1
c                  write(*,*) 'inner loop ',i,j                                                     
                  dx=x(i+time,j)-x(i,j)
                  dxs=dxs+dx*dx
                  dy=y(i+time,j)-y(i,j)
                  dys=dys+dy*dy
                  dz=z(i+time,j)-z(i,j)
                  dzs=dzs+dz*dz
               enddo
            enddo
            dr2=dxs+dys+dzs
            disp(nt)=dr2/float(nav)/float(numb(nt))
            jstart=jstart+numb(nt)
         enddo
         write(*,900) realtime,(disp(nt),nt=1,ntype)
      enddo
 900  format(f12.2,12f12.6)
      stop
      end



